/* --------------------------------------------------------------------
 * (C) kd 2010
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@implementation IFDefaultModel : IFModel {

/*
   sub entityNamespace {
       my ($self) = @_;
       return IF::Application->defaultApplication()->configurationValueForKey("DEFAULT_ENTITY_ROOT");
   }
*/

+ entityRoot {
    [IFLog error:"You must subclass entityRoot and specify the path to your entity directory"];
    OS.exit(1);
}

/* this populates the model entries for entities that are
   not mentioned in the model that was loaded from the .pmodel file
*/
- populateModel {
    /*
    var entityDir = [self entityRoot]
                || die "No entity root defined";

    IFLog.debug("Seeking entities in entityDir");
    var entities = [];
    opendir(DIR, entityDir) || die "Can't opendir entityDir: $!";
    var names = grep { /^[^ + ]/ && /\ + pm$/ } readdir(DIR);
    closedir DIR;

    var ecdClass = [self entityClassDescriptionClassName];
    foreach var name (names) {
        name =~ s/\ + pm//g;
        IFLog.debug(" + .. name . + .");

        var fqn = self.NAMESPACE->{ENTITY} + "::name";
        IFLog.debug(": fqn");
        eval "use fqn;";
        if ($@) {
            IFLog.error($@);
            next;
        }
        if (exists self.ENTITIES->{name}) {
            IFLog.debug("Skipping name, it already exists in the .pmodel");
            next;
        }

        unless ([fqn isa:"IFEntityPersistent"]("IFEntityPersistent")) {
            IFLog.warning("Skipping name because it's a transient entity");
            next;
        }

        unless ([fqn can:"Model"]("Model")) {
            IFLog.warning("fqn is not enhanced with Model-Fu");
            next;
        }

        var m = [fqn Model];

        self.ENTITIES->{name} = [fqn __modelEntryOfClassFromArray:ecdClass, m](ecdClass, m);
    }
    */
}

@end
